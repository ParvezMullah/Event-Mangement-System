using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EventManagementSystem.Startup))]
namespace EventManagementSystem
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
