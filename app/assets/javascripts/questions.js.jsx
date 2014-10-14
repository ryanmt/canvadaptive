/** @jsx React.DOM */

var QuestionRoot = React.createClass({
  render: function() {
    return (
      <p>
        Say Hi!
      </p>
    )
  }
})

React.renderComponent(
  <QuestionRoot/>, document.getElementById("question_content")
);