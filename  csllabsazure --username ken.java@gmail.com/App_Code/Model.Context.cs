﻿//------------------------------------------------------------------------------
// <auto-generated>
//    這個程式碼是由範本產生。
//
//    對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//    如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

public partial class LabsDBEntities : DbContext
{
    public LabsDBEntities()
        : base("name=LabsDBEntities")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }

    public DbSet<Answer> Answers { get; set; }
    public DbSet<DiscussionA> DiscussionAs { get; set; }
    public DbSet<DiscussionAFeedback> DiscussionAFeedbacks { get; set; }
    public DbSet<DiscussionB> DiscussionBs { get; set; }
    public DbSet<Lab> Labs { get; set; }
    public DbSet<Question> Questions { get; set; }
    public DbSet<ScaleAnswer> ScaleAnswers { get; set; }
    public DbSet<Status> Status { get; set; }
    public DbSet<Survey> Surveys { get; set; }
    public DbSet<User> Users { get; set; }
}
