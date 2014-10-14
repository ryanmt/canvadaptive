/** @jsx React.DOM */

var CodeTester = React.createClass({
  render: function() {
    return (
      <p>
        Say Hi!
      </p>
    )
  }
})

React.renderComponent(
  <CodeTester/>, document.body
);