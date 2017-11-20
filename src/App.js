import React from 'react'

class App extends React.Component {
  constructor (props) {
    super(props)

    this.state = {
      who: 'World 3',
      isToggleOn: true
    }

    // This binding is necessary to make `this` work in the callback
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.setState(prevState => ({
      isToggleOn: !prevState.isToggleOn
    }));
  }

  render () {
    return (
      <div>
        <h1>App component</h1>
        <p>Hello, {this.state.who}!</p>

        <button onClick={this.handleClick}>
        {this.state.isToggleOn ? 'ON' : 'OFF'}
        </button>
      </div>
    )
  }
}

export default App
