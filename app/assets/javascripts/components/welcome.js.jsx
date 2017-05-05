class Welcome extends React.Component {
  render () {
    return (
      <main>
        <h2>Welcome to TexArch </h2>
        <div class="content-box center">
          <div class="welcome">
            <div class="row">
              <section className="left-side col-md-8 ">
                <h4>TexArch is an online tool hosting data supportive to
                    archaeological research, with an emphasis
                    on the Texas Archaic period.
                    <a href="/calf_creek_horizon">  Learn more...</a>
                </h4>
                <img src="/images/landscape.jpg" className="welcome-image img-rounded" alt="Texas Landscape" />
              </section>
              <Author />
            </div>
          </div>
        </div>
      </main>
    );
  }
};
