using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BDCourceForWeb.Startup))]
namespace BDCourceForWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
