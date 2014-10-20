/** @jsx React.DOM */

var AnswerRows = React.createClass({
  getInitialState: function () {
    return{checked: false};
  },
  updateSelection: function(answer, i) {
    if (this.state.checked === i) {
      this.setState({checked: false});
    } else {
      this.setState({checked: Number(i)});
    }
    this.props.change_callback();
  },
  render: function() {
    return(
      <div className="answerRows" key="answer_row">
        {this.props.answers.map(function(answer, i) {
          if (!answer.text) {
            return true
          }
          return (
            <div className="answerRow" key={answer.id}>
              <label className="Canvadaptive__AnswerText">
                <input
                  type="checkbox"
                  key={answer.id}
                  value={i}
                  checked={this.state.checked === i ? 'checked' : false}
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
  getInitialState: function() {
    return {disabled:true}
  },
  componentDidMount: function() {
    console.log(this.props)
  },
  submitAnswer: function(e) {
    e.preventDefault();
    var index = this.refs.answers.state.checked;
    $.ajax({
      url: this.props.question.post_url,
      method: 'post',
      dataType: 'json',
      data: {"selected_answer": this.props.question.answers[index], test_instance_id: this.props.test_instance.id},
      success: function(data) {
        console.log(data)
        this.replaceProps(data)
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.question.post_url, xhr.responseText,status, err.toString());
      }.bind(this)
    });
  },
  getNextQuestion: function(e) {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      success: function(data) {
        console.log("SUCCESS!!")
        this.props.newData = data;
      }.bind(this),
    });
  },
  getCheckedState: function(e) {
    var checked_boxes = $(".answerRow input:checked")
    this.setState({disabled: checked_boxes.length > 0 ? false : true})
  },
  render: function() {
    return (
      <div className="card-holder">
        <div className="showQuestionCard x-card host">
          <h3 dangerouslySetInnerHTML={{__html: this.props.question.text}}></h3>
          <form id="AnswerForm" className="AnswerForm" onSubmit={this.handleSubmit}>
            <AnswerRows ref="answers" answers={this.props.question.answers} change_callback={this.getCheckedState}/>
            <div className="answer_submit">
              <button
                disabled={this.state.disabled}
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