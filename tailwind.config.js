const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
    content: [
        "./vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php",
        "./vendor/laravel/jetstream/**/*.blade.php",
        "./storage/framework/views/*.php",
        "./resources/views/**/*.blade.php",
    ],

    theme: {
        extend: {
            colors: {
                strawberry: {
                    100: "#ff8c82",
                    300: "#ed5353",
                    500: "#c6262e",
                    700: "#a10705",
                    900: "#7a0000",
                },

                orange: {
                    100: "#ffc27d",
                    300: "#ffa154",
                    500: "#f37329",
                    700: "#cc3b02",
                    900: "#a62100",
                },

                banana: {
                    100: "#fff394",
                    300: "#ffe16b",
                    500: "#f9c440",
                    700: "#d48e15",
                    900: "#ad5f00",
                },

                lime: {
                    100: "#d1ff82",
                    300: "#9bdb4d",
                    500: "#68b723",
                    700: "#3a9104",
                    900: "#206b00",
                },

                mint: {
                    100: "#89ffdd",
                    300: "#43d6b5",
                    500: "#28bca3",
                    700: "#0e9a83",
                    900: "#007367",
                },

                blueberry: {
                    100: "#8cd5ff",
                    300: "#64baff",
                    500: "#3689e6",
                    700: "#0d52bf",
                    900: "#002e99",
                },

                grape: {
                    100: "#e4c6fa",
                    300: "#cd9ef7",
                    500: "#a56de2",
                    700: "#7239b3",
                    900: "#452981",
                },

                bubblegum: {
                    100: "#fe9ab8",
                    300: "#f4679d",
                    500: "#de3e80",
                    700: "#bc245d",
                    900: "#910e38",
                },

                cocoa: {
                    100: "#a3907c",
                    300: "#8a715e",
                    500: "#715344",
                    700: "#57392d",
                    900: "#3d211b",
                },

                silver: {
                    100: "#fafafa",
                    300: "#d4d4d4",
                    500: "#abacae",
                    700: "#7e8087",
                    900: "#555761",
                },

                slate: {
                    100: "#95a3ab",
                    300: "#667885",
                    500: "#485a6c",
                    700: "#273445",
                    900: "#0e141f",
                },

                black: {
                    100: "#666666",
                    300: "#4d4d4d",
                    500: "#333333",
                    700: "#1a1a1a",
                    900: "#000000",
                },
            },

            fontFamily: {
                ui: [
                    "Inter",
                    '"Open Sans"',
                    '"Nato Sans"',
                    "Roboto",
                    '"Droid Sans"',
                    "sans-serif",
                ],
                copy: [
                    '"Nato Serif"',
                    '"Droid Serif"',
                    '"New York"',
                    '"Times New Roman"',
                    "Times",
                    "serif",
                ],
                heading: [
                    "Inter",
                    "Raleway",
                    '"Open Sans"',
                    '"Nato Sans"',
                    "Roboto",
                    '"Droid Sans"',
                    "sans-serif",
                ],
            },
        },
    },

    plugins: [
        require("@tailwindcss/forms"),
        require("@tailwindcss/typography"),
    ],
};
