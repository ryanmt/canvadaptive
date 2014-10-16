/** @jsx React.DOM */

var TestIndex = React.createClass({

    propTypes: {
    },
    onChange: function(e) {
      React.renderComponent()
    },

    render: function () {
          var rows = []
          this.props.tests.forEach(function(test) {
            rows.push(
              <div z="1" className="testTableRow x-card host" key={test.id}>
                <label className="CanvadaptiveTestIndex__Title">{test.title}</label>
                <button type="button" onChange={this.onChange} className="CanvadaptiveTestIndex__StartButton paper-button raisedButton">Start this test</button>
                <div className="paper-shadow-bottom"></div>
              </div>)
          });
          return (
        <div className="testTable card-holder">
          <div className="card-contents">
            {rows}
          </div>
        </div>
    )}
});