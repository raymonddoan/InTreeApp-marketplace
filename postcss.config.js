module.exports = {
  plugins: [
    // tailwindcss injection
    require('tailwindcss')("./app/javascript/stylesheets/tailwind.config.js"),
    require('autoprefixer'),

    // preset
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ]
}
