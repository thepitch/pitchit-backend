/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var Dimensions = require('Dimensions');

var PageOne = require('./components/PageOne')
var PageTwo = require('./components/PageTwo')
var PageThree = require('./components/PageThree')

// Get the width and height of the window
var {
  width,
  height
} = Dimensions.get('window')

var {
  AppRegistry,
  Component,
  Image,
  ListView,
  StyleSheet,
  Text,
  View,
  Navigator,
  TouchableHighlight
} = React;
// Navigator configuration
var BaseConfig = Navigator.SceneConfigs.FloatFromRight

var CustomLeftToRightGesture = Object.assign({}, BaseConfig.gestures.pop, {
  // Make it snap back really quickly after canceling pop
  snapVelocity: 8,
  // Make it so we can drag anywhere on the screen
  edgeHitWidth: width
})

var CustomSceneConfig = Object.assign({}, BaseConfig, {
  // A tightly wound spring will make this transition fast
  springTension: 100,
  springFriction: 1,
  // Use our custom gesture defined above
  gestures: {
    pop: CustomLeftToRightGesture
  }
})

var API_KEY = '7waqfqbprs7pajbz28mqf6vz';
var API_URL = 'http://localhost:3000';
var PAGE_SIZE = 25;
var PARAMS = '?apikey=' + API_KEY + '&page_limit=' + PAGE_SIZE;
var REQUEST_URL = API_URL;







var thepitchnative = React.createClass({
  getInitialState: function() {
    return {
      dataSource: new ListView.DataSource({
        rowHasChanged: (row1, row2) => row1 !== row2,
      }),
      loaded: false,
    };
  },

  componentDidMount: function() {
    this.fetchData();
  },
  // A simple switch statement to allow our router to work
  _renderScene: function(route, navigator) {
    switch (route.id) {
      case 1:
        return <PageOne navigator={navigator} />
      case 2:
        return <PageTwo navigator={navigator} />
      case 3:
        return <PageThree navigator={navigator} />
    }
  },

  fetchData: function() {
    fetch(REQUEST_URL)
      .then((response) => response.json())
      .then((responseData) => {
        this.setState({
          dataSource: this.state.dataSource.cloneWithRows(responseData.data),
          loaded: true,
        });
      })
      .done();
  },

  render: function() {
    if (!this.state.loaded) {
      return this.renderLoadingView();
    }

    return (
      <View>
      <Navigator
        initialRoute={{id: 1}}
        renderScene={this._renderScene} />

      <ListView
        dataSource={this.state.dataSource}
        renderRow={this.renderPitch}
        style={styles.listView} />
        </View>
    );
  },

  renderLoadingView: function() {
    return (
      <View style={styles.container}>
        <Text>
          Loading movies...
        </Text>
      </View>
    );
  },

  renderPitch: function(pitch) {
    return (
      <View style={styles.container}>
        <Image
          source={{url: pitch.media}}
          style={styles.thumbnail} />
        <View style={styles.rightContainer}>
          <Text style={styles.title}>{pitch.title}</Text>
          <Text style={styles.year}>Tagline: {pitch.tagline}</Text>
        </View>
      </View>
    );
  },
});

var styles = StyleSheet.create({

  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
    color: 'white'
  },
  container: {
    flex: 1,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  rightContainer: {
    flex: 1,
  },
  title: {
    fontSize: 20,
    marginBottom: 8,
    textAlign: 'center',
  },
  year: {
    textAlign: 'center',
  },
  thumbnail: {
    width: 53,
    height: 81,
  },
  listView: {
    paddingTop: 20,
    backgroundColor: '#F5FCFF',
  },
});
AppRegistry.registerComponent('thepitchnative', () => thepitchnative);

