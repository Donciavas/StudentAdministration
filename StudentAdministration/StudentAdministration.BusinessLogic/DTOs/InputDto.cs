using System.ComponentModel.DataAnnotations;

namespace StudentAdministration.BusinessLogic.DTOs
{
    public class InputDto
    {
        [Required]
        [MaxLength(50)]
        public string? Name { get; set; }
        [Required]
        [Range(1, 100, ErrorMessage = "Only positive and below 100 number is allowed")]
        public int Credits { get; set; }
        [MaxLength(50)]
        public string? BelongsToName { get; set; }
    }
}
