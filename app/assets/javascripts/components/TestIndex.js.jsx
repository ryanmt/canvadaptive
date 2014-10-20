/** @jsx React.DOM */

var TestIndex = React.createClass({

  propTypes: {
  },
  loadTest: function(i) {
    window.location.replace(this.props.tests[i].url.replace(".json", "/take"))
  },

  render: function () {
    return(
      <div className="testTable card-holder">
        <div className="card-contents">
          {this.props.tests.map(function(test, i) {
            return (
              <div className="testTableRow x-card host" key={test.id}>
                <label className="CanvadaptiveTestIndex__Title" htmlFor={"test" + test.id}>
                  {test.title}
                </label>
                <button
                  onClick={this.loadTest.bind(test, i)}
                  id={"test" + test.id}
                  key={i}
                  type="button"
                  className="CanvadaptiveTestIndex__StartButton paper-button raisedButton">
                  Start this test
                </button>
              </div>
            );
          }, this)}
        </div>
      </div>
    )
  }
});