/** @jsx React.DOM */

var PagesRoot = React.createClass({
  render: function() {
    return (
      <p>
        Say Hi!
      </p>
    )
  }
})

React.renderComponent(
  <PagesRoot/>, document.getElementById("pages_content")
);