@props(['disabled' => false])

<input {{ $disabled ? 'disabled' : '' }} {!! $attributes->merge(['class' => 'border-gray-300 focus:border-blueberry-500 focus:ring focus:ring-blueberry-100 focus:ring-opacity-50 rounded shadow-sm']) !!}>
