/** @jsx React.DOM */

var AnswerShow = React.createClass({
  componentDidMount: function() {
    console.log(this.props)
    $.get(this.props.source, function(results) {
    });
  },
  answerSelected: function(e) {
    console.log(e.target.value)
  },
  render: function() {
    return (
      <div id="answerShow">
        <input type='checkbox' value={this.props}/>
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

var QuizTaking = React.createClass({
  render: function() {
    return (
      <div className="card-holder">
        <div id="showQuestionCard x-card host">
          <h1>Question </h1>
          <QuestionShow />
        </div>
      </div>
    )
  }
})