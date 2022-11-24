using Microsoft.AspNetCore.Mvc;
using StudentAdministration.BusinessLogic.DTOs;
using StudentAdministration.BusinessLogic.Services;
using StudentAdministration.Database.DTOs;
using StudentAdministration.Database.Models;

namespace PersonRegistrationASPNet.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class StudiesSubSubjectController : ControllerBase
    {
        private readonly IStudiesSubSubjectService _service;
        public StudiesSubSubjectController(IStudiesSubSubjectService studiesSubSubjectService)
        {
            _service = studiesSubSubjectService;
        }
        [HttpGet("Get All Studies SubSubject")]
        public List<StudiesSubSubject>? GetAllStudiesSubSubject()
        {
            return _service.GetAllStudiesSubSubject();
        }
        [HttpPost("Save Studies SubSubject To Program")]
        public ActionResult<ResponseDto> SaveStudiesSubSubjectToProgram([FromBody] InputDto inputDto)
        {
            var response = _service.SaveStudiesSubSubjectToProgram(inputDto);
            if (!response.IsSuccess)
                return BadRequest(response.Message);
            return response;
        }
        [HttpPost("Save Studies SubSubject To Subject")]
        public ActionResult<ResponseDto> SaveStudiesSubSubjectToSubject([FromBody] InputDto inputDto)
        {
            var response = _service.SaveStudiesSubSubjectToSubject(inputDto);
            if (!response.IsSuccess)
                return BadRequest(response.Message);
            return response;
        }
        [HttpPost("Save Studies SubSubject To SubSubject")]
        public ActionResult<ResponseDto> SaveStudiesSubSubjectToSubSubject([FromBody] InputDto inputDto)
        {
            var response = _service.SaveStudiesSubSubjectToSubSubject(inputDto);
            if (!response.IsSuccess)
                return BadRequest(response.Message);
            return response;
        }
    }
}
