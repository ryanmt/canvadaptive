/** @jsx React.DOM */

var TestIndex = React.createClass({

    propTypes: {
        testName: React.PropTypes.string.isRequired
    },

    render: function () {
        return <div>
            <h1 className="CanvadaptiveStartScreen__TestTitle">{this.props.testName}</h1>
            <button type="button" className="CanvadaptiveStartScreen__StartButton">Start Test</button>
        </div>
    }
});