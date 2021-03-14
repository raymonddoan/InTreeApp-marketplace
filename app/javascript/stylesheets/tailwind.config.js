module.exports = {
  purge: [
  './app/**/*.html.erb',
  './app/helpers/**/*.rb',
  './app/javascript/**/*.js',
  './src/**/*.html',
  './src/**/*.js',
  './src/**/*.jsx',
  ],

  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        primary: "#006d8f",
        secondary: "80b6c7",
        tertiary: "002f3d",
        up: "00afb9",
        down: "f07167",
      }
    },
  },
  variants: {
    extend: {},
  },
    plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/aspect-ratio'),
  ],

}
