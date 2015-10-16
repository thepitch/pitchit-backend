var React = require('react');
var Pitch = require('./Pitch.jsx');

module.exports = React.createClass({
  render: function() {
    var pitch = this.props.data.map(function(pitch) {
      return (
        <Pitch key={pitch.id} title={pitch.title} />
      );
    });

    return (
      <ul className="pitch-list">
        {pitch}
      </ul>
    );
  }
});