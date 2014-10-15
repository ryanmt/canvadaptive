/** @jsx React.DOM */

var TestRoot = React.createClass({
  render: function() {
    return (
      <p>
        $.get()
      </p>
    )
  }
})

React.renderComponent(
  <TestRoot/>, document.getElementById("test_content")
);