var ReactRouter = require('react-router');
var Router = ReactRouter.Router;
var Route = ReactRouter.Route;
var Link = ReactRouter.Link;

React.render((
  <Router>
    <Route path="/" component={App}>
      <Route path="pitches" component={PitchIndex}>
        <Route path="/pitches/:pitchId" component={Pitch}/>
      </Route>
      <Route path="users" component={Users}>
        <Route path="/users/:userId" component={User}/>
      </Route>
      <Route path="*" component={NoMatch}/>
    </Route>
  </Router>
), document.body)

