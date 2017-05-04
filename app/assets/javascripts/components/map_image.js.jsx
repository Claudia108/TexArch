class MapImage extends React.Component {
  render () {
    var mapImage;
    if (this.props.user) {
      mapImage =
        <a href="/map">
          <img src="/images/Figure1.jpg" className="welcome-image img-rounded" alt="Geographic Range"/>
        </a>
    } else {
      mapImage =
        <img src="/images/Figure1.jpg" className="welcome-image img-rounded" alt="Geographic Range"/>
    }
    return (
      <div className="col-md-5 shadow-element padded">
        <h4>Geographic Range of the Calf Creek Horizon</h4>
        {mapImage}
      </div>
    )
  }
}
