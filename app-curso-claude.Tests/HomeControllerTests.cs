using app_curso_claude.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace app_curso_claude.Tests
{
    public class HomeControllerTests
    {
        [Fact]
        public void Index_ReturnsViewResult()
        {
            var controller = new HomeController();

            var result = controller.Index();

            Assert.IsType<ViewResult>(result);
        }

        [Fact]
        public void Privacy_ReturnsViewResult()
        {
            var controller = new HomeController();

            var result = controller.Privacy();

            Assert.IsType<ViewResult>(result);
        }
    }
}
