using Microsoft.AspNetCore.Mvc;
using StudentAdministration.BusinessLogic.DTOs;
using StudentAdministration.BusinessLogic.Services;
using StudentAdministration.Database.DTOs;
using StudentAdministration.Database.Models;

namespace PersonRegistrationASPNet.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class StudiesSubjectController : ControllerBase
    {
        private readonly IStudiesSubjectService _Service;
        public StudiesSubjectController(IStudiesSubjectService studiesSubjectService)
        {
            _Service = studiesSubjectService;
        }
        [HttpGet("Get all studies subjects")]
        public List<StudiesSubject>? GetAllStudiesSubject()
        {
            return _Service.GetAllStudiesSubject();
        }
        [HttpPost("Save Studies Subject To Program")]
        public ActionResult<ResponseDto> SaveStudiesSubjectToProgram([FromBody] InputDto inputDto)
        {
            var response = _Service.SaveStudiesSubjectToProgram(inputDto);
            if (!response.IsSuccess)
                return BadRequest(response.Message);
            return response;
        }
    }
}
