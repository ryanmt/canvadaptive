/** @jsx React.DOM */

var AnswerRows = React.createClass({
  getInitialState: function () {
    return{checked: null};
  },
  updateSelection: function(answer, i) {
    if (this.state.checked == i) {
      this.setState({checked: null});
    } else {
      this.setState({checked: i});
    }
  },
  render: function() {
    return(
      <div className="answerRows" key="answer_row">
        {this.props.answers.map(function(answer, i) {
          if (!answer.text) {
            return true
          }
          return (
            <div id="answerRow" key={answer.id}>
              <label className="Canvadaptive__AnswerText">
                <input
                  type="checkbox"
                  key={answer.id}
                  value={answer.id}
                  checked={this.state.checked == i ? 'checked' : false}
                  onChange={this.updateSelection.bind(this, answer, i)}
                  />
                {answer.text}
              </label>
            </div>
          );
        }, this)}
      </div>
    )
  }
});

var QuizTaking = React.createClass({
  componentDidMount: function() {
  },
  submitAnswer: function(e) {
    e.preventDefault();
    var index = this.refs.answers.state.checked;
    $.ajax({
      url: this.props.question.post_url,
      method: 'post',
      dataType: 'json',
      data: {"selected_answer": this.props.question.answers[index]}, // TODO Where do I get my data?
      success: function(data) {
        this.setState({data: data});
        console.log(data);
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.question.post_url, status, err.toString());
      }.bind(this)
    });
    this.getNextQuestion();
  },
  getNextQuestion: function(e) {
    console.log("In getNextQuestion")
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      success: function(data) {
        console.log("SUCCESS!!")
        this.props.newData = data;
      }.bind(this),
    });
  },
  render: function() {
    return (
      <div className="card-holder">
        <div className="showQuestionCard x-card host">
          <h3 dangerouslySetInnerHTML={{__html: this.props.question.text}}></h3>
          <form id="AnswerForm" className="AnswerForm" onSubmit={this.handleSubmit}>
            <AnswerRows ref="answers" answers={this.props.question.answers}/>
            <div className="answer_submit">
              <button
                onClick={this.submitAnswer}
                type="button"
                form="AnswerForm"
                formaction={this.props.question.post_url}
                formmethod="post"
                className="paper-button raisedButton AnswerSubmitButton">
                  Submit
              </button>
            </div>
          </form>
        </div>
      </div>
    )
  }
})