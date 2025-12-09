// resources/js/utils/image.ts
// Resolve image URL and provide inline SVG fallback (no external file required)

const INLINE_PLACEHOLDER =
    'data:image/svg+xml;utf8,' +
    encodeURIComponent(
        `<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1600 1200'>
      <rect width='100%' height='100%' fill='#f3f4f6'/>
      <text x='50%' y='50%' dominant-baseline='middle' text-anchor='middle' fill='#9ca3af' font-family='Arial, Helvetica, sans-serif' font-size='48'>No image</text>
    </svg>`,
    );

export function resolveImageUrl(
    path?: string | string[] | null,
    fallback: string = INLINE_PLACEHOLDER,
): string {
    if (!path) return fallback;

    // If array: take first non-empty string
    if (Array.isArray(path)) {
        for (const p of path) {
            if (typeof p === 'string' && p.trim())
                return resolveImageUrl(p, fallback);
        }
        return fallback;
    }

    // If not string, try to stringify
    if (typeof path !== 'string') {
        try {
            path = String(path);
        } catch {
            return fallback;
        }
    }

    // Trim + remove escaped slashes/newlines
    path = path.trim().replace(/\s+/g, '').replace(/\\\//g, '/');

    // If looks like JSON array string -> parse and recurse
    if (
        (path.startsWith('["') || path.startsWith("['")) &&
        (path.endsWith('"]') || path.endsWith("']"))
    ) {
        try {
            const parsed = JSON.parse(path);
            if (Array.isArray(parsed) && parsed.length > 0) {
                return resolveImageUrl(parsed[0], fallback);
            }
        } catch {
            // continue
        }
    }

    // If path contains multiple URLs inside (rare), pick first http(s) match
    const urlMatch = path.match(/https?:\/\/[^\s"']+/);
    if (urlMatch) return urlMatch[0];

    // protocol-relative
    if (path.startsWith('//')) return `https:${path}`;

    // absolute http(s)
    if (/^https?:\/\//i.test(path)) return path;

    // Normalize typical placehold.co mistakes:
    // e.g. https://placehold.co/400x400.png/00aaee?text=...  -> /400x400/00aaee/png?text=...
    if (path.includes('placehold.co')) {
        // replace "/{wxh}.png/{hex}?text=" -> "/{wxh}/{hex}/png?text="
        path = path.replace(
            /(placehold\.co\/\d+x\d+)\.png\/([0-9a-fA-F]{3,6})(\?.*)/,
            '$1/$2/png$3',
        );
        // ensure '/png' exists before query if missing
        if (path.includes('?text=') && !/\/png(\.|\/|\?)/.test(path)) {
            path = path.replace(/(placehold\.co\/\d+x\d+)(.*)/, '$1/png$2');
        }
        // Often placehold returns valid url — return as-is now
        if (/^https?:\/\//.test(path)) return path;
        return `https://${path.replace(/^https?:\/\//, '')}`;
    }

    // If starts with /storage or /images or absolute local
    if (
        path.startsWith('/storage/') ||
        path.startsWith('/images/') ||
        path.startsWith('/')
    ) {
        return path;
    }

    // Otherwise assume it's a storage path and prefix /storage/
    return `/storage/${path.replace(/^\/+/, '')}`;
}
export default resolveImageUrl;
