/** @jsx React.DOM */

var TestShow = React.createClass({

    propTypes: {
    },

    render: function () {
          var rows = []
          this.props.answers.forEach(function(answer) {
            rows.push(
              <div z="1" className="question x-card host" key={question.id}>
                <label className="">{test.title}
                  <input checkbox />
                </label>
                
                <div className="paper-shadow-bottom"></div>
              </div>)
          });
          return (
        <div className="questionHolder taking-a-test card-holder">
          {rows}
        </div>
    )}
});