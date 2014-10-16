/** @jsx React.DOM */

var TestIndex = React.createClass({

    propTypes: {
        testData: React.PropTypes.object.isRequired
    },

    render: function () {
          var rows = []
          this.props.testData.tests.forEach(function(test) {
            console.log(test)
            rows.push(
              <div className="testTableRow" key={test.id}>
                // FORM HERE?
                <label className="CanvadaptiveTestIndex__Title">{test.title}</label>
                <button type="button" className="CanvadaptiveTestIndex__StartButton">Start this test</button>
              </div>)
          });
          return (
        <div className="testTable">
          {rows}
        </div>
    )}
});