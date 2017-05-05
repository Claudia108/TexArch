class Navbar extends React.Component {
  render () {
    if (this.props.user) {
      var userNav = <UserNavbar user={this.props.user} admin={this.props.admin } />
    } else {
      var userNav =
        <ul className="nav navbar-nav navbar-right">
          <li><a href="/auth/google_oauth2" id="sign-in">Sign in with Google</a></li>
        </ul>
    }
    return (
      <div>
        <div className="jumbotron container">
          <h1>TexArch</h1>
        </div>
        <nav className="navbar navbar-inverse">
          <div className="container-fluid">

            <div className="navbar-header">
              <a className="navbar-brand" href="/">HOME</a>
            </div>
            <div className="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul className="nav navbar-nav">
                <li className="dropdown">
                  <a id="dLabel" data_target="#" href="/calf_creek_horizon" className="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Calf Creek Horizon<span className="caret"></span></a>
                  <ul className="dropdown-menu" area-labelledby="dLabel">
                    <li><a href="/calf_creek_horizon">Overview</a></li>
                    <li><a href="/info">Learn more ...</a></li>
                    <li><a href="/info/preforms">CCH Preforms</a></li>
                  </ul>
                </li>
              </ul>
              {userNav}
            </div>
          </div>
        </nav>
      </div>
    )
  }
}
