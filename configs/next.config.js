module.exports = {
  // webpack5: true,
  webpack: config => {
    config.resolve.fallback = {
      tls: empty,
      net: empty,
      fs: empty,
    };

    return config;
  },
};