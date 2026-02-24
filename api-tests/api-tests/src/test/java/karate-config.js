function fn() {
  var env = karate.env; // e.g. pass with: mvn test -Dkarate.env=e2e
  karate.log('karate.env system property was:', env);

  if (!env) {
    env = 'dev';
  }

  // Base config shared across environments
  var config = {
    env: env,
    baseUrl: 'https://automationintesting.online/api'
  };

  // Optional: environment-specific overrides
  if (env == 'dev') {
    // config.baseUrl = 'https://automationintesting.online/api';
  } else if (env == 'e2e') {
    // config.baseUrl = 'https://automationintesting.online/api';
  }

  return config;
}
