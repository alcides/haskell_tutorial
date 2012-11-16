DateTime dt1 = new DateTime(2009, 07, 15);
DateTime dt2 = new DateTime(2010, 04, 15);

// LINQ query for files between 15-July 2009 and 15-April 2010.

var files = from file in DirInfo.EnumerateFiles()
where file.CreationTimeUtc > dt1 &
file.CreationTimeUtc < dt2                       
select file;