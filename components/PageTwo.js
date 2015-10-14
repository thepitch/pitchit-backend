var React = require('react-native')
var styles = require('../stylesheets/layout')

// Import components


// Destructured components
var {
  Component,
  Text,
  View,
  TouchableHighlight
} = React;

class PageTwo extends Component {
  constructor(props) {
    super(props)
  }
  _handlePress() {
    this.props.navigator.push({id :3})
  }
  _goBack() {
    this.props.navigator.pop()
  }

  render() {
    return (
      <View style={[styles.container, {backgroundColor: 'blue'}]}>
        <Text style={styles.welcome}>Page two</Text>
        <TouchableHighlight onPress={this._handlePress.bind(this)}>
          <View style={{paddingVertical: 10, paddingHorizontal: 20, backgroundColor: 'black'}}>
            <Text style={styles.welcome}>Go to last page</Text>
          </View>
        </TouchableHighlight>
        <TouchableHighlight onPress={this._goBack.bind(this)} style={styles.backButton}>
          <Text style={styles.welcome}>Back</Text>
        </TouchableHighlight>
      </View>
    )
  }
}

module.exports = PageTwo