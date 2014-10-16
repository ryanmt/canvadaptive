/** @jsx React.DOM */

var TestIndex = React.createClass({

    propTypes: {
    },
    onClick: function(e) {
      console.log(e.target)
      console.log(test.url)
    },

    render: function () {
          var rows = this.props.tests.map(function(test) {
            return (
              <div z="1" className="testTableRow x-card host" key={test.id}>
                <label className="CanvadaptiveTestIndex__Title">{test.title}</label>
                <button onClick={this.onClick} type="button" className="CanvadaptiveTestIndex__StartButton paper-button raisedButton">Start this test</button>
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