import ReactOnRails from 'react-on-rails';

import Agentlist from '../bundles/Agent/components/listofagents';
import Agent from '../bundles/Agent/components/agent';
import Requestsent from '../bundles/Agent/components/requestsent';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  Agentlist,
  Agent,
  Requestsent,
});
