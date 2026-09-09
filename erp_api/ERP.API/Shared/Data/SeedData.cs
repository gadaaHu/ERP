

namespace ERP.API.Shared.Data;

public static class SeedData
{
    public static void Initialize(AppDbContext context)
    {
        if (context.Employees.Any()) return;

        // --- HR: Employees ---
        context.Employees.AddRange(
            new Employee { FullName = "Abebe Kebede", Email = "abebe.kebede@erp.gov.et", Phone = "+251911234567", Department = "Administration", Position = "Director General", HireDate = new DateTime(2018, 1, 15), Status = "Active", Salary = 45000m, Gender = "Male" },
            new Employee { FullName = "Tigist Hailu", Email = "tigist.hailu@erp.gov.et", Phone = "+251912345678", Department = "Finance", Position = "Finance Director", HireDate = new DateTime(2019, 3, 20), Status = "Active", Salary = 38000m, Gender = "Female" },
            new Employee { FullName = "Dawit Mengistu", Email = "dawit.m@erp.gov.et", Phone = "+251913456789", Department = "IT", Position = "IT Manager", HireDate = new DateTime(2020, 6, 1), Status = "Active", Salary = 35000m, Gender = "Male" },
            new Employee { FullName = "Sara Tadesse", Email = "sara.t@erp.gov.et", Phone = "+251914567890", Department = "Human Resources", Position = "HR Manager", HireDate = new DateTime(2019, 8, 12), Status = "Active", Salary = 32000m, Gender = "Female" },
            new Employee { FullName = "Yonas Bekele", Email = "yonas.b@erp.gov.et", Phone = "+251915678901", Department = "Procurement", Position = "Procurement Officer", HireDate = new DateTime(2021, 2, 5), Status = "Active", Salary = 28000m, Gender = "Male" },
            new Employee { FullName = "Meron Alemu", Email = "meron.a@erp.gov.et", Phone = "+251916789012", Department = "Finance", Position = "Accountant", HireDate = new DateTime(2021, 5, 18), Status = "Active", Salary = 25000m, Gender = "Female" },
            new Employee { FullName = "Henok Girma", Email = "henok.g@erp.gov.et", Phone = "+251917890123", Department = "IT", Position = "Software Developer", HireDate = new DateTime(2022, 1, 10), Status = "Active", Salary = 30000m, Gender = "Male" },
            new Employee { FullName = "Bethlehem Tesfaye", Email = "bethlehem.t@erp.gov.et", Phone = "+251918901234", Department = "Administration", Position = "Executive Secretary", HireDate = new DateTime(2020, 9, 22), Status = "Active", Salary = 22000m, Gender = "Female" },
            new Employee { FullName = "Solomon Woldemariam", Email = "solomon.w@erp.gov.et", Phone = "+251919012345", Department = "Legal", Position = "Legal Advisor", HireDate = new DateTime(2019, 11, 3), Status = "Active", Salary = 35000m, Gender = "Male" },
            new Employee { FullName = "Hanna Mulugeta", Email = "hanna.m@erp.gov.et", Phone = "+251920123456", Department = "Human Resources", Position = "Training Coordinator", HireDate = new DateTime(2022, 4, 15), Status = "Active", Salary = 24000m, Gender = "Female" },
            new Employee { FullName = "Bereket Assefa", Email = "bereket.a@erp.gov.et", Phone = "+251921234567", Department = "Procurement", Position = "Supply Chain Analyst", HireDate = new DateTime(2023, 1, 8), Status = "Active", Salary = 26000m, Gender = "Male" },
            new Employee { FullName = "Rahel Desta", Email = "rahel.d@erp.gov.et", Phone = "+251922345678", Department = "Finance", Position = "Budget Analyst", HireDate = new DateTime(2022, 7, 20), Status = "OnLeave", Salary = 27000m, Gender = "Female" },
            new Employee { FullName = "Temesgen Gebre", Email = "temesgen.g@erp.gov.et", Phone = "+251923456789", Department = "IT", Position = "System Administrator", HireDate = new DateTime(2021, 9, 14), Status = "Active", Salary = 29000m, Gender = "Male" },
            new Employee { FullName = "Kidist Worku", Email = "kidist.w@erp.gov.et", Phone = "+251924567890", Department = "Administration", Position = "Office Manager", HireDate = new DateTime(2020, 3, 28), Status = "Active", Salary = 23000m, Gender = "Female" },
            new Employee { FullName = "Ermias Tadesse", Email = "ermias.t@erp.gov.et", Phone = "+251925678901", Department = "Projects", Position = "Project Manager", HireDate = new DateTime(2021, 6, 7), Status = "Active", Salary = 34000m, Gender = "Male" },
            new Employee { FullName = "Selamawit Berhane", Email = "selamawit.b@erp.gov.et", Phone = "+251926789012", Department = "Legal", Position = "Contract Specialist", HireDate = new DateTime(2023, 3, 12), Status = "Active", Salary = 28000m, Gender = "Female" },
            new Employee { FullName = "Getachew Mekonen", Email = "getachew.m@erp.gov.et", Phone = "+251927890123", Department = "Finance", Position = "Auditor", HireDate = new DateTime(2020, 11, 25), Status = "Active", Salary = 31000m, Gender = "Male" },
            new Employee { FullName = "Aster Negash", Email = "aster.n@erp.gov.et", Phone = "+251928901234", Department = "Procurement", Position = "Inventory Manager", HireDate = new DateTime(2022, 8, 3), Status = "Active", Salary = 26000m, Gender = "Female" },
            new Employee { FullName = "Tewodros Haile", Email = "tewodros.h@erp.gov.et", Phone = "+251929012345", Department = "Projects", Position = "Business Analyst", HireDate = new DateTime(2023, 5, 19), Status = "Active", Salary = 29000m, Gender = "Male" },
            new Employee { FullName = "Meseret Abate", Email = "meseret.a@erp.gov.et", Phone = "+251930123456", Department = "Human Resources", Position = "Payroll Officer", HireDate = new DateTime(2021, 12, 1), Status = "Active", Salary = 24000m, Gender = "Female" }
        );

        // --- Finance: Transactions ---
        context.Transactions.AddRange(
            new Transaction { Type = "Income", Amount = 2500000m, Category = "Government Grant", Description = "Q1 Federal budget allocation", ReferenceNumber = "TXN-2024-001", Date = new DateTime(2024, 1, 15), Status = "Completed" },
            new Transaction { Type = "Income", Amount = 850000m, Category = "Service Fee", Description = "Document processing service fees", ReferenceNumber = "TXN-2024-002", Date = new DateTime(2024, 1, 22), Status = "Completed" },
            new Transaction { Type = "Expense", Amount = 420000m, Category = "Salary", Description = "January payroll processing", ReferenceNumber = "TXN-2024-003", Date = new DateTime(2024, 1, 30), Status = "Completed" },
            new Transaction { Type = "Expense", Amount = 85000m, Category = "Utilities", Description = "Electricity and water bills", ReferenceNumber = "TXN-2024-004", Date = new DateTime(2024, 2, 5), Status = "Completed" },
            new Transaction { Type = "Income", Amount = 1200000m, Category = "Project Fund", Description = "Digital transformation project funding", ReferenceNumber = "TXN-2024-005", Date = new DateTime(2024, 2, 10), Status = "Completed" },
            new Transaction { Type = "Expense", Amount = 350000m, Category = "Equipment", Description = "IT equipment purchase - servers", ReferenceNumber = "TXN-2024-006", Date = new DateTime(2024, 2, 15), Status = "Completed" },
            new Transaction { Type = "Expense", Amount = 120000m, Category = "Maintenance", Description = "Building maintenance and repairs", ReferenceNumber = "TXN-2024-007", Date = new DateTime(2024, 2, 20), Status = "Completed" },
            new Transaction { Type = "Income", Amount = 450000m, Category = "Service Fee", Description = "Consulting service revenue", ReferenceNumber = "TXN-2024-008", Date = new DateTime(2024, 3, 1), Status = "Completed" },
            new Transaction { Type = "Expense", Amount = 420000m, Category = "Salary", Description = "February payroll processing", ReferenceNumber = "TXN-2024-009", Date = new DateTime(2024, 3, 2), Status = "Completed" },
            new Transaction { Type = "Expense", Amount = 95000m, Category = "Travel", Description = "Staff training travel expenses", ReferenceNumber = "TXN-2024-010", Date = new DateTime(2024, 3, 8), Status = "Pending" },
            new Transaction { Type = "Income", Amount = 2500000m, Category = "Government Grant", Description = "Q2 Federal budget allocation", ReferenceNumber = "TXN-2024-011", Date = new DateTime(2024, 4, 1), Status = "Completed" },
            new Transaction { Type = "Expense", Amount = 180000m, Category = "Training", Description = "Staff capacity building program", ReferenceNumber = "TXN-2024-012", Date = new DateTime(2024, 4, 10), Status = "Pending" },
            new Transaction { Type = "Expense", Amount = 65000m, Category = "Supplies", Description = "Office supplies and stationery", ReferenceNumber = "TXN-2024-013", Date = new DateTime(2024, 4, 15), Status = "Completed" },
            new Transaction { Type = "Income", Amount = 320000m, Category = "Rental Income", Description = "Building space rental income", ReferenceNumber = "TXN-2024-014", Date = new DateTime(2024, 4, 20), Status = "Completed" },
            new Transaction { Type = "Expense", Amount = 420000m, Category = "Salary", Description = "March payroll processing", ReferenceNumber = "TXN-2024-015", Date = new DateTime(2024, 4, 1), Status = "Completed" }
        );

        // --- Purchase: Purchase Orders ---
        context.PurchaseOrders.AddRange(
            new PurchaseOrder { OrderNumber = "PO-2024-001", Vendor = "Ethio Telecom", Description = "Annual internet service subscription", TotalAmount = 240000m, Status = "Approved", OrderDate = new DateTime(2024, 1, 5), DeliveryDate = new DateTime(2024, 1, 10), RequestedBy = "Dawit Mengistu" },
            new PurchaseOrder { OrderNumber = "PO-2024-002", Vendor = "Zemen Office Supplies", Description = "Office furniture - desks and chairs", TotalAmount = 185000m, Status = "Received", OrderDate = new DateTime(2024, 1, 12), DeliveryDate = new DateTime(2024, 1, 25), RequestedBy = "Kidist Worku" },
            new PurchaseOrder { OrderNumber = "PO-2024-003", Vendor = "Aser Technology PLC", Description = "Dell Laptops (10 units)", TotalAmount = 950000m, Status = "Approved", OrderDate = new DateTime(2024, 1, 20), DeliveryDate = new DateTime(2024, 2, 5), RequestedBy = "Dawit Mengistu" },
            new PurchaseOrder { OrderNumber = "PO-2024-004", Vendor = "Sheger Printing", Description = "Printed forms and stationery", TotalAmount = 45000m, Status = "Received", OrderDate = new DateTime(2024, 2, 1), DeliveryDate = new DateTime(2024, 2, 8), RequestedBy = "Bethlehem Tesfaye" },
            new PurchaseOrder { OrderNumber = "PO-2024-005", Vendor = "Total Ethiopia", Description = "Vehicle fuel - quarterly supply", TotalAmount = 120000m, Status = "Pending", OrderDate = new DateTime(2024, 2, 10), RequestedBy = "Yonas Bekele" },
            new PurchaseOrder { OrderNumber = "PO-2024-006", Vendor = "Cisco Systems", Description = "Network switches and routers", TotalAmount = 380000m, Status = "Draft", OrderDate = new DateTime(2024, 2, 15), RequestedBy = "Temesgen Gebre" },
            new PurchaseOrder { OrderNumber = "PO-2024-007", Vendor = "Mesfin Industrial PLC", Description = "Generator maintenance parts", TotalAmount = 95000m, Status = "Approved", OrderDate = new DateTime(2024, 2, 20), DeliveryDate = new DateTime(2024, 3, 1), RequestedBy = "Yonas Bekele" },
            new PurchaseOrder { OrderNumber = "PO-2024-008", Vendor = "Habesha Cleaning Services", Description = "Annual cleaning service contract", TotalAmount = 156000m, Status = "Approved", OrderDate = new DateTime(2024, 3, 1), RequestedBy = "Kidist Worku" },
            new PurchaseOrder { OrderNumber = "PO-2024-009", Vendor = "Canon Ethiopia", Description = "Printers and scanners (5 units)", TotalAmount = 225000m, Status = "Pending", OrderDate = new DateTime(2024, 3, 5), RequestedBy = "Dawit Mengistu" },
            new PurchaseOrder { OrderNumber = "PO-2024-010", Vendor = "Wegagen Security", Description = "Security services contract renewal", TotalAmount = 288000m, Status = "Received", OrderDate = new DateTime(2024, 3, 10), DeliveryDate = new DateTime(2024, 3, 15), RequestedBy = "Abebe Kebede" }
        );

        // --- Fixed Assets ---
        context.Assets.AddRange(
            new Asset { Name = "Toyota Land Cruiser", AssetCode = "VEH-001", Category = "Vehicle", Location = "Main Office Garage", PurchaseDate = new DateTime(2020, 5, 15), PurchasePrice = 4500000m, CurrentValue = 3200000m, Status = "Active", AssignedTo = "Abebe Kebede" },
            new Asset { Name = "Toyota Hilux Pickup", AssetCode = "VEH-002", Category = "Vehicle", Location = "Main Office Garage", PurchaseDate = new DateTime(2021, 3, 20), PurchasePrice = 3200000m, CurrentValue = 2500000m, Status = "Active", AssignedTo = "Field Operations" },
            new Asset { Name = "Dell PowerEdge Server", AssetCode = "IT-001", Category = "IT Equipment", Location = "Server Room", PurchaseDate = new DateTime(2022, 1, 10), PurchasePrice = 850000m, CurrentValue = 600000m, Status = "Active", AssignedTo = "IT Department" },
            new Asset { Name = "HP ProDesk Desktops (20)", AssetCode = "IT-002", Category = "IT Equipment", Location = "Offices", PurchaseDate = new DateTime(2022, 6, 5), PurchasePrice = 1200000m, CurrentValue = 800000m, Status = "Active", AssignedTo = "Various Departments" },
            new Asset { Name = "Office Building - Block A", AssetCode = "BLD-001", Category = "Building", Location = "Addis Ababa, Bole", PurchaseDate = new DateTime(2015, 1, 1), PurchasePrice = 25000000m, CurrentValue = 30000000m, Status = "Active", AssignedTo = "Organization" },
            new Asset { Name = "Conference Room Furniture Set", AssetCode = "FRN-001", Category = "Furniture", Location = "Conference Hall", PurchaseDate = new DateTime(2021, 8, 12), PurchasePrice = 350000m, CurrentValue = 250000m, Status = "Active", AssignedTo = "Administration" },
            new Asset { Name = "Caterpillar Generator 100KVA", AssetCode = "MCH-001", Category = "Machinery", Location = "Generator Room", PurchaseDate = new DateTime(2019, 11, 5), PurchasePrice = 1500000m, CurrentValue = 900000m, Status = "UnderMaintenance", AssignedTo = "Facilities" },
            new Asset { Name = "Canon Copier iR-ADV C5535", AssetCode = "IT-003", Category = "IT Equipment", Location = "Copy Room", PurchaseDate = new DateTime(2023, 2, 14), PurchasePrice = 320000m, CurrentValue = 280000m, Status = "Active", AssignedTo = "Shared" },
            new Asset { Name = "Executive Desk Set (Director)", AssetCode = "FRN-002", Category = "Furniture", Location = "Director Office", PurchaseDate = new DateTime(2020, 4, 22), PurchasePrice = 180000m, CurrentValue = 120000m, Status = "Active", AssignedTo = "Abebe Kebede" },
            new Asset { Name = "Suzuki Minibus", AssetCode = "VEH-003", Category = "Vehicle", Location = "Main Office Garage", PurchaseDate = new DateTime(2018, 7, 30), PurchasePrice = 2800000m, CurrentValue = 1200000m, Status = "Disposed", AssignedTo = "N/A" },
            new Asset { Name = "Cisco Network Rack", AssetCode = "IT-004", Category = "IT Equipment", Location = "Server Room", PurchaseDate = new DateTime(2022, 9, 1), PurchasePrice = 420000m, CurrentValue = 350000m, Status = "Active", AssignedTo = "IT Department" },
            new Asset { Name = "Office Chairs (50 units)", AssetCode = "FRN-003", Category = "Furniture", Location = "Various Offices", PurchaseDate = new DateTime(2023, 1, 20), PurchasePrice = 500000m, CurrentValue = 450000m, Status = "Active", AssignedTo = "Various" }
        );

        // --- Service Requests ---
        context.ServiceRequests.AddRange(
            new ServiceRequest { Title = "Network connectivity issue in Block B", Description = "Internet connection dropping frequently in 2nd floor offices", Priority = "High", Status = "InProgress", RequestedBy = "Tigist Hailu", AssignedTo = "Temesgen Gebre", Department = "Finance", CreatedDate = new DateTime(2024, 3, 1) },
            new ServiceRequest { Title = "Broken AC unit in Conference Room", Description = "Air conditioning not working in the main conference hall", Priority = "Medium", Status = "Open", RequestedBy = "Bethlehem Tesfaye", AssignedTo = "", Department = "Administration", CreatedDate = new DateTime(2024, 3, 5) },
            new ServiceRequest { Title = "Request for additional office keys", Description = "Need 3 duplicate keys for new HR office", Priority = "Low", Status = "Resolved", RequestedBy = "Sara Tadesse", AssignedTo = "Facilities Team", Department = "Human Resources", CreatedDate = new DateTime(2024, 2, 20), ResolvedDate = new DateTime(2024, 2, 25) },
            new ServiceRequest { Title = "Printer paper jam - 3rd Floor", Description = "Canon printer showing persistent paper jam error", Priority = "Medium", Status = "Resolved", RequestedBy = "Meron Alemu", AssignedTo = "Henok Girma", Department = "Finance", CreatedDate = new DateTime(2024, 2, 28), ResolvedDate = new DateTime(2024, 3, 1) },
            new ServiceRequest { Title = "Water leak in archive room", Description = "Ceiling leak damaging archived documents", Priority = "Critical", Status = "InProgress", RequestedBy = "Kidist Worku", AssignedTo = "Facilities Team", Department = "Administration", CreatedDate = new DateTime(2024, 3, 8) },
            new ServiceRequest { Title = "Request for parking space allocation", Description = "New staff member needs designated parking", Priority = "Low", Status = "Open", RequestedBy = "Hanna Mulugeta", AssignedTo = "", Department = "Human Resources", CreatedDate = new DateTime(2024, 3, 10) },
            new ServiceRequest { Title = "Email account setup for new hire", Description = "Create email and system accounts for Bereket Assefa", Priority = "High", Status = "Resolved", RequestedBy = "Sara Tadesse", AssignedTo = "Dawit Mengistu", Department = "IT", CreatedDate = new DateTime(2024, 1, 5), ResolvedDate = new DateTime(2024, 1, 6) },
            new ServiceRequest { Title = "Generator fuel refill needed", Description = "Backup generator fuel tank at 15% capacity", Priority = "High", Status = "InProgress", RequestedBy = "Temesgen Gebre", AssignedTo = "Yonas Bekele", Department = "IT", CreatedDate = new DateTime(2024, 3, 12) },
            new ServiceRequest { Title = "Office cleaning schedule change", Description = "Request to move cleaning to after 6PM", Priority = "Low", Status = "Resolved", RequestedBy = "Bethlehem Tesfaye", AssignedTo = "Facilities Team", Department = "Administration", CreatedDate = new DateTime(2024, 2, 15), ResolvedDate = new DateTime(2024, 2, 18) },
            new ServiceRequest { Title = "Software license renewal - Adobe Suite", Description = "Adobe Creative Suite licenses expiring next week", Priority = "High", Status = "Open", RequestedBy = "Henok Girma", AssignedTo = "", Department = "IT", CreatedDate = new DateTime(2024, 3, 15) }
        );

        // --- Projects ---
        context.Projects.AddRange(
            new Project { Name = "Digital Transformation Initiative", Description = "Modernize all paper-based processes to digital workflows", StartDate = new DateTime(2024, 1, 1), EndDate = new DateTime(2025, 6, 30), Budget = 5000000m, SpentAmount = 1250000m, Progress = 25, Status = "InProgress", Manager = "Dawit Mengistu", TeamSize = 8 },
            new Project { Name = "HR Management System", Description = "Implement comprehensive HR information system", StartDate = new DateTime(2024, 2, 1), EndDate = new DateTime(2024, 12, 31), Budget = 2500000m, SpentAmount = 800000m, Progress = 35, Status = "InProgress", Manager = "Sara Tadesse", TeamSize = 5 },
            new Project { Name = "Office Building Renovation", Description = "Renovate Block B offices and meeting rooms", StartDate = new DateTime(2024, 3, 1), EndDate = new DateTime(2024, 9, 30), Budget = 8000000m, SpentAmount = 2000000m, Progress = 20, Status = "InProgress", Manager = "Kidist Worku", TeamSize = 12 },
            new Project { Name = "Staff Capacity Building Program", Description = "Training and development program for all staff", StartDate = new DateTime(2024, 1, 15), EndDate = new DateTime(2024, 12, 15), Budget = 1500000m, SpentAmount = 450000m, Progress = 40, Status = "InProgress", Manager = "Hanna Mulugeta", TeamSize = 3 },
            new Project { Name = "Financial Reporting Automation", Description = "Automate monthly and quarterly financial reports", StartDate = new DateTime(2023, 10, 1), EndDate = new DateTime(2024, 4, 30), Budget = 1200000m, SpentAmount = 1100000m, Progress = 90, Status = "InProgress", Manager = "Tigist Hailu", TeamSize = 4 },
            new Project { Name = "Network Infrastructure Upgrade", Description = "Upgrade LAN/WAN infrastructure across all buildings", StartDate = new DateTime(2024, 4, 1), EndDate = new DateTime(2024, 8, 31), Budget = 3500000m, SpentAmount = 0m, Progress = 0, Status = "Planning", Manager = "Temesgen Gebre", TeamSize = 6 },
            new Project { Name = "Document Archiving Project", Description = "Digitize and archive historical paper documents", StartDate = new DateTime(2023, 6, 1), EndDate = new DateTime(2024, 2, 28), Budget = 800000m, SpentAmount = 780000m, Progress = 100, Status = "Completed", Manager = "Bethlehem Tesfaye", TeamSize = 7 },
            new Project { Name = "Procurement System Enhancement", Description = "Upgrade procurement workflows with approval chains", StartDate = new DateTime(2024, 5, 1), EndDate = new DateTime(2024, 11, 30), Budget = 1800000m, SpentAmount = 0m, Progress = 0, Status = "Planning", Manager = "Yonas Bekele", TeamSize = 4 }
        );

        // --- Documents ---
        context.Documents.AddRange(
            new Document { Title = "Annual Strategic Plan 2024", Category = "Policy", FileType = "PDF", FileSize = 2540000, UploadedBy = "Abebe Kebede", UploadDate = new DateTime(2024, 1, 5), Version = 3, Status = "Active", Department = "Administration" },
            new Document { Title = "Employee Handbook v2.1", Category = "Manual", FileType = "PDF", FileSize = 5120000, UploadedBy = "Sara Tadesse", UploadDate = new DateTime(2024, 1, 10), Version = 2, Status = "Active", Department = "Human Resources" },
            new Document { Title = "Q1 Financial Report", Category = "Report", FileType = "XLSX", FileSize = 1850000, UploadedBy = "Tigist Hailu", UploadDate = new DateTime(2024, 4, 5), Version = 1, Status = "PendingReview", Department = "Finance" },
            new Document { Title = "IT Security Policy", Category = "Policy", FileType = "PDF", FileSize = 1200000, UploadedBy = "Dawit Mengistu", UploadDate = new DateTime(2024, 2, 1), Version = 1, Status = "Active", Department = "IT" },
            new Document { Title = "Vendor Contract - Ethio Telecom", Category = "Contract", FileType = "PDF", FileSize = 890000, UploadedBy = "Selamawit Berhane", UploadDate = new DateTime(2024, 1, 8), Version = 1, Status = "Active", Department = "Legal" },
            new Document { Title = "Budget Proposal FY2025", Category = "Report", FileType = "XLSX", FileSize = 3200000, UploadedBy = "Meron Alemu", UploadDate = new DateTime(2024, 3, 15), Version = 2, Status = "Draft", Department = "Finance" },
            new Document { Title = "Board Meeting Minutes - Jan 2024", Category = "Memo", FileType = "DOCX", FileSize = 450000, UploadedBy = "Bethlehem Tesfaye", UploadDate = new DateTime(2024, 1, 20), Version = 1, Status = "Active", Department = "Administration" },
            new Document { Title = "Procurement Guidelines Manual", Category = "Manual", FileType = "PDF", FileSize = 4100000, UploadedBy = "Yonas Bekele", UploadDate = new DateTime(2024, 2, 12), Version = 1, Status = "Active", Department = "Procurement" },
            new Document { Title = "Project Charter - Digital Transformation", Category = "Report", FileType = "DOCX", FileSize = 1650000, UploadedBy = "Ermias Tadesse", UploadDate = new DateTime(2024, 1, 2), Version = 3, Status = "Active", Department = "Projects" },
            new Document { Title = "Leave Policy Amendment 2024", Category = "Policy", FileType = "PDF", FileSize = 320000, UploadedBy = "Sara Tadesse", UploadDate = new DateTime(2024, 3, 1), Version = 1, Status = "PendingReview", Department = "Human Resources" },
            new Document { Title = "Asset Disposal Report Q4 2023", Category = "Report", FileType = "PDF", FileSize = 980000, UploadedBy = "Aster Negash", UploadDate = new DateTime(2024, 1, 15), Version = 1, Status = "Archived", Department = "Procurement" },
            new Document { Title = "Building Safety Inspection Report", Category = "Report", FileType = "PDF", FileSize = 2800000, UploadedBy = "Kidist Worku", UploadDate = new DateTime(2024, 2, 28), Version = 1, Status = "Active", Department = "Administration" }
        );

        // --- Reports/Plans ---
        context.Reports.AddRange(
            new Report { Title = "Annual Performance Report 2023", Module = "All", Type = "Report", Period = "Annual 2023", Status = "Completed", CreatedBy = "Abebe Kebede", CreatedDate = new DateTime(2024, 1, 30), DueDate = new DateTime(2024, 2, 15), CompletionPercentage = 100 },
            new Report { Title = "Q1 2024 Strategic Plan Review", Module = "All", Type = "Plan", Period = "Q1 2024", Status = "Completed", CreatedBy = "Abebe Kebede", CreatedDate = new DateTime(2024, 4, 1), DueDate = new DateTime(2024, 4, 15), CompletionPercentage = 100 },
            new Report { Title = "HR Workforce Analysis Report", Module = "HR", Type = "Report", Period = "Q1 2024", Status = "InProgress", CreatedBy = "Sara Tadesse", CreatedDate = new DateTime(2024, 3, 20), DueDate = new DateTime(2024, 4, 10), CompletionPercentage = 65 },
            new Report { Title = "Financial Audit Report FY2023", Module = "Finance", Type = "Report", Period = "Annual 2023", Status = "Approved", CreatedBy = "Getachew Mekonen", CreatedDate = new DateTime(2024, 2, 1), DueDate = new DateTime(2024, 3, 1), CompletionPercentage = 100 },
            new Report { Title = "Procurement Efficiency Plan 2024", Module = "Purchase", Type = "Plan", Period = "Annual 2024", Status = "InProgress", CreatedBy = "Yonas Bekele", CreatedDate = new DateTime(2024, 1, 15), DueDate = new DateTime(2024, 6, 30), CompletionPercentage = 40 },
            new Report { Title = "Asset Depreciation Schedule", Module = "Assets", Type = "Report", Period = "Annual 2024", Status = "Draft", CreatedBy = "Aster Negash", CreatedDate = new DateTime(2024, 3, 10), DueDate = new DateTime(2024, 4, 30), CompletionPercentage = 20 },
            new Report { Title = "IT Infrastructure Development Plan", Module = "Projects", Type = "Plan", Period = "2024-2025", Status = "Approved", CreatedBy = "Dawit Mengistu", CreatedDate = new DateTime(2024, 1, 5), DueDate = new DateTime(2024, 2, 1), CompletionPercentage = 100 },
            new Report { Title = "Service Delivery Performance Report", Module = "Services", Type = "Report", Period = "Q1 2024", Status = "InProgress", CreatedBy = "Kidist Worku", CreatedDate = new DateTime(2024, 3, 25), DueDate = new DateTime(2024, 4, 15), CompletionPercentage = 55 },
            new Report { Title = "Five-Year Strategic Plan 2024-2029", Module = "All", Type = "Plan", Period = "2024-2029", Status = "Draft", CreatedBy = "Abebe Kebede", CreatedDate = new DateTime(2024, 2, 1), DueDate = new DateTime(2024, 6, 30), CompletionPercentage = 30 },
            new Report { Title = "Document Management Compliance Report", Module = "Documents", Type = "Report", Period = "Q1 2024", Status = "Completed", CreatedBy = "Bethlehem Tesfaye", CreatedDate = new DateTime(2024, 3, 30), DueDate = new DateTime(2024, 4, 5), CompletionPercentage = 100 }
        );

        context.SaveChanges();
    }
}
