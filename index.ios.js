'use strict';

var React = require('react-native');
var Router = require('react-native-router');

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

var API_URL = 'http://localhost:3000';
var count = 0;
// The initial page
var ShowPage = React.createClass({
  render: function(){
    return(
      <Text>{API_URL+'/pitches/'+this.props.data}</Text>
      )
  }
});
var ShowPager = React.createClass({
  render: function(){
    return(
      <Text>{API_URL+'/pitches/'+this.props.data}</Text>
      )
  }
});
var HelloPage = React.createClass({
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
  fetchData: function() {
    fetch(API_URL)
      .then((response) => response.json())
      .then((responseData) => {
        this.setState({
          dataSource: this.state.dataSource.cloneWithRows(responseData.data),
          loaded: true,
        });
      })
      .done();
  },

  nextPage: function() {
    this.props.toRoute({
      name: "A new screen",
      component: ShowPage,
      data: num1
    });
  },
  nextPager: function() {
    this.props.toRoute({
      name: "A new screen",
      component: ShowPager,
      data: num2
    });
  },

  renderLoadingView: function() {
    return (
      <View style={styles.container}>
        <Text>
          Loading pitches...
        </Text>
      </View>
    );
  },

  renderPitch: function(pitch) {
    var variableDynamic = count;
    window['num'+ variableDynamic] = pitch.id;
    count += 1;
    return (
      <View style={styles.container}>
        <View style={styles.rightContainer}>
          <Text style={styles.title}>{pitch.title}</Text>
          <Text style={styles.year}>Tagline: {pitch.tagline}</Text>
          <Text style={styles.year}>{pitch.id}</Text>
        </View>
      </View>
    );
  },
  render: function() {
    if (!this.state.loaded) {
      return this.renderLoadingView();
    }
    return (
      <View>
        <TouchableHighlight onPress={this.nextPage} underlayColor="transparent" >
        <ListView
        dataSource={this.state.dataSource}
        renderRow={this.renderPitch}
        style={styles.listView} />
        </TouchableHighlight>

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

// Your route object should contain at least:
// - The name of the route (which will become the navigation bar title)
// - The component object for the page to render
var firstRoute = {
  name: 'Welcome!',
  component: HelloPage
};

// The Router wrapper
var MyApp = React.createClass({
  render() {
    return (
      <Router firstRoute={firstRoute} />
    )
  }
});

AppRegistry.registerComponent('thepitchnative', () => MyApp);