class Welcome extends React.Component {
  render () {
    return (
      <section className="left-side col-md-8 ">
        <h4>TexArch is an online tool hosting data supportive to
            archaeological research, with an emphasis
            on the Texas Archaic period.
            <a href="/calf_creek_horizon">  Learn more...</a>
        </h4>
        <img src="/images/landscape.jpg" className="welcome-image img-rounded" alt="Texas Landscape" />      
      </section>
    );
  }
};
