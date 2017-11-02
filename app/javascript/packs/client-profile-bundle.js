import ReactOnRails from 'react-on-rails';

import ClientProfile from '../bundles/ClientProfile/components/ClientProfile';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  ClientProfile,
});
