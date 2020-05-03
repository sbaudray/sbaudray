module.exports = {
  purge: {
    content: ["../**/*.html.eex"],
  },
  theme: {
    extend: {
      fontFamily: {
        display: ["Playfair Display", "serif"],
      },
      gridTemplateColumns: {
        work: "100px max-content",
      },
    },
  },
  variants: {},
  plugins: [],
};
