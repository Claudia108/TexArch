class CalfCreekHorizon extends React.Component {
  render () {
    return (
      <section>
        <h2>Calf Creek Horizon</h2>
        <div className="row">
          <div className="content-box">
            <div className="col-md-7">
              <CalfCreek />
              <ArtifactLinks user={this.props.user} />
            </div>

            <div className="content-box">
              <MapImage user={this.props.user} />
            </div>
          </div>
          <section className="row">
              <FlakeDebris />
              <Preforms />
          </section>
        </div>
      </section>
    )
  }
}
