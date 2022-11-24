﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using StudentAdministration.Database;

#nullable disable

namespace StudentAdministration.Database.Migrations
{
    [DbContext(typeof(ApplicationDbContext))]
    partial class ApplicationDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.8")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("StudentAdministration.Database.Models.Student", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("LastName")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("nvarchar(20)");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("nvarchar(20)");

                    b.Property<string>("PersonalNumber")
                        .IsRequired()
                        .HasMaxLength(11)
                        .HasColumnType("nvarchar(11)");

                    b.HasKey("Id");

                    b.ToTable("Student", (string)null);
                });

            modelBuilder.Entity("StudentAdministration.Database.Models.StudentStudieEnroll", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<int>("EnrollYear")
                        .HasColumnType("int");

                    b.Property<Guid>("ProgramId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("StudentId")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("ProgramId");

                    b.HasIndex("StudentId");

                    b.ToTable("StudentStudieEnrolls", (string)null);
                });

            modelBuilder.Entity("StudentAdministration.Database.Models.StudiesProgram", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<int>("Credits")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.HasKey("Id");

                    b.ToTable("StudiesPrograms", (string)null);
                });

            modelBuilder.Entity("StudentAdministration.Database.Models.StudiesSubSubject", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<int>("Credits")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<Guid?>("StudiesProgramId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid?>("StudiesSubSubjectId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid?>("StudiesSubjectId")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("StudiesProgramId");

                    b.HasIndex("StudiesSubSubjectId");

                    b.HasIndex("StudiesSubjectId");

                    b.ToTable("StudiesSubSubject", (string)null);
                });

            modelBuilder.Entity("StudentAdministration.Database.Models.StudiesSubject", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<int>("Credits")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<Guid?>("StudiesProgramId")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("StudiesProgramId");

                    b.ToTable("StudiesSubject", (string)null);
                });

            modelBuilder.Entity("StudentAdministration.Database.Models.StudentStudieEnroll", b =>
                {
                    b.HasOne("StudentAdministration.Database.Models.StudiesProgram", "Program")
                        .WithMany()
                        .HasForeignKey("ProgramId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("StudentAdministration.Database.Models.Student", "Student")
                        .WithMany("StudentStudieEnrolls")
                        .HasForeignKey("StudentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Program");

                    b.Navigation("Student");
                });

            modelBuilder.Entity("StudentAdministration.Database.Models.StudiesSubSubject", b =>
                {
                    b.HasOne("StudentAdministration.Database.Models.StudiesProgram", null)
                        .WithMany("SubSubjectList")
                        .HasForeignKey("StudiesProgramId");

                    b.HasOne("StudentAdministration.Database.Models.StudiesSubSubject", null)
                        .WithMany("SubSubjectListOfSubSubject")
                        .HasForeignKey("StudiesSubSubjectId");

                    b.HasOne("StudentAdministration.Database.Models.StudiesSubject", null)
                        .WithMany("SubSubjectList")
                        .HasForeignKey("StudiesSubjectId");
                });

            modelBuilder.Entity("StudentAdministration.Database.Models.StudiesSubject", b =>
                {
                    b.HasOne("StudentAdministration.Database.Models.StudiesProgram", null)
                        .WithMany("SubjectList")
                        .HasForeignKey("StudiesProgramId");
                });

            modelBuilder.Entity("StudentAdministration.Database.Models.Student", b =>
                {
                    b.Navigation("StudentStudieEnrolls");
                });

            modelBuilder.Entity("StudentAdministration.Database.Models.StudiesProgram", b =>
                {
                    b.Navigation("SubSubjectList");

                    b.Navigation("SubjectList");
                });

            modelBuilder.Entity("StudentAdministration.Database.Models.StudiesSubSubject", b =>
                {
                    b.Navigation("SubSubjectListOfSubSubject");
                });

            modelBuilder.Entity("StudentAdministration.Database.Models.StudiesSubject", b =>
                {
                    b.Navigation("SubSubjectList");
                });
#pragma warning restore 612, 618
        }
    }
}