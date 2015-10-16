var React = require('react');

module.exports = React.createClass({
  render: function() {
    return (
      <li className="pitch">
        <span className="pitch-text">{this.props.title}</span>
      </li>
    );
  }
});