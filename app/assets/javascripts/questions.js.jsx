/** @jsx React.DOM */

var AnswerShow = React.createClass({
  componentDidMount: function() {
    $.get(this.props.source, function(results) {
    });
  },
  render: function() {
    return (
      <div id="answerShow">
        <input  />
        <p> Answer goes here </p>
      </div>
    )
  }
});
var QuestionShow = React.createClass({
  componentDidMount: function() {
    $.get(this.props.source, function(results) {
    });
  },
  render: function() {
    return (
      <div className="questionText">
        <AnswerShow />
      </div>
    )
  }
})

var QuestionRoot = React.createClass({
  render: function() {
    return (
      <div id="showQuestion">
        <h1>Question </h1>
        <QuestionShow />
      </div>
    )
  }
})

React.renderComponent(
  <QuestionRoot/>, document.getElementById("question_content")
);
