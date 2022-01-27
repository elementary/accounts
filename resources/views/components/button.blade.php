<button {{ $attributes->merge(['type' => 'submit', 'class' => 'inline-flex items-center px-4 py-2 bg-blueberry-500 border border-transparent rounded font-semibold text-xs text-white uppercase tracking-widest hover:bg-blueberry-700 active:bg-blueberry-900 focus:outline-none focus:border-blueberry-700 focus:ring focus:ring-blueberry-100 disabled:opacity-25 transition']) }}>
    {{ $slot }}
</button>
