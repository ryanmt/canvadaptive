/** @jsx React.DOM */
var Card = React.createClass({
  render: function() {
    return(<div>this.contents</div>)
  }
});
xreact.register('x-card', 'Card');
var TestIndex = React.createClass({

    propTypes: {
        testData: React.PropTypes.object.isRequired
    },

    render: function () {
          var rows = []
          this.props.testData.tests.forEach(function(test) {
            rows.push(
              <x-card z="1" className="testTableRow" key={test.id}>
                <label className="CanvadaptiveTestIndex__Title">{test.title}</label>
                <button type="button" className="CanvadaptiveTestIndex__StartButton">Start this test</button>
              </x-card>)
          });
          return (
        <div className="testTable">
          {rows}
        </div>
    )}
});