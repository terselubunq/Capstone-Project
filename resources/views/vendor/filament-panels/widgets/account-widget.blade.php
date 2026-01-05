@php
    $user = filament()->auth()->user();
@endphp

<x-filament-widgets::widget class="fi-account-widget">
    <x-filament::section>
        <x-filament-panels::avatar.user
            size="lg"
            :user="$user"
            loading="lazy"
        />

        <div class="fi-account-widget-main">
            <h2 class="fi-account-widget-heading">
                {{ __('filament-panels::widgets/account-widget.welcome', ['app' => config('app.name')]) }}
            </h2>

            <p class="fi-account-widget-user-name">
                {{ filament()->getUserName($user) }}
            </p>
        </div>

        <a
            href="/"
            class="fi-account-widget-logout-form"
        >
            <x-filament::button
                color="gray"
                icon="heroicon-o-home"
                labeled-from="sm"
                tag="a"
                href="/"
            >
                Back to Home
            </x-filament::button>
        </a>
    </x-filament::section>
</x-filament-widgets::widget>
