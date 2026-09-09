using AutoMapper;
using ERP.API.Application.DTOs;
using ERP.API.Domain.Entities;

namespace ERP.API.Application.Mappings;

public class AttendanceMappingProfile : Profile
{
    public AttendanceMappingProfile()
    {
        CreateMap<Attendance, AttendanceDto>()
            .ForMember(dest => dest.EmployeeName, opt => opt.MapFrom(src => $"{src.User.FirstName} {src.User.LastName}"))
            .ForMember(dest => dest.Status, opt => opt.MapFrom(src => src.Status.ToString()))
            .ForMember(dest => dest.Type, opt => opt.MapFrom(src => src.Type.ToString()));
    }
}
