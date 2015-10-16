var React = require('react');
var PitchList = require('./List.jsx');

module.exports = React.createClass({
  getInitialState: function() {
    return {data: []};
  },
  componentDidMount: function() {
    this.readPitchesFromAPI();
  },
  readPitchesFromAPI: function() {
    this.props.readFromAPI(this.props.origin + '/pitches', function(pitches) {
      this.setState({data: pitches.data});
    }.bind(this));
  },
  render: function() {
    return (
      <div className="pitches-view">
        <PitchList data={this.state.data} />
      </div>
    );
  }
});