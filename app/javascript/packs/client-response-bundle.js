import ReactOnRails from 'react-on-rails';

import ClientResponse from '../bundles/ClientResponse/components/ClientResponse';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  ClientResponse,
});
