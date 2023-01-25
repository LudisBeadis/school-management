from django.shortcuts import render,redirect
from django.http import HttpResponse,HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from home.models import *
from student.models import *
from .models import *
from django.contrib import messages
from django.db.models import Sum



@login_required(login_url='login')
def index(request):
    web = Webpack.objects.get(pk=1)
    user = request.user
    pp = Profile.objects.get(user=user)
    teacher = Teacher.objects.get(profile=pp)
    student = Student.objects.all().order_by('grade','first_name','last_name')
    accept_student = Student.objects.filter(is_verified=False)
    if request.method == "POST":
        if 'accept' in request.POST:
            id=request.POST['id']
            s = Student.objects.get(id=id)
            s.is_verified=True
            s.save()
            messages.success(request,"User accepted")
        if 'delete' in request.POST:
            id=request.POST['id']
            s = Student.objects.get(id=id)
            s.profile.user.delete()
            messages.success(request,"User deleted")
    context = {
        "web":web,
        'user':user,
        'teacher':teacher,
        'student':student,
        'accept':accept_student
    }
    return render(request,'teacher/index.html',context)

def saveresult(request):
    user = request.user
    pp = Profile.objects.get(user=user)
    teacher = Teacher.objects.get(profile=pp)
    if request.method=='POST':
        id1 = request.POST['student_id']
        student = Student.objects.get(pk=id1)
        id2 = request.POST['test_id']
        test = Test.objects.get(id=id2)
        id3 = request.POST['result_id']
        input = request.POST['input']
        if 'update' in request.POST:
            up = Result.objects.get(pk=id3)
            up.status = input
            up.save()
            id = up.subject.id
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

@login_required(login_url='login')
def oneresults(request,id):
    web = Webpack.objects.get(pk=1)
    user = request.user
    pp = Profile.objects.get(user=user)
    teacher = Teacher.objects.get(profile=pp)
    grade = Grade.objects.get(pk=id)
    y = AcademicYear.objects.last()
    totalll = None
    totall = None
    if Teacher.objects.filter(profile=pp,my_room=grade).exists():
        student = Student.objects.filter(grade=grade.name,is_verified=True)
        test = Test.objects.filter(grade=grade,time="first academic term",year=y)
        result = Result.objects.filter(subject=teacher.subject,time="first academic term",year=y)
        if request.method == 'POST':
            if 'test_add' in request.POST:
                amount = request.POST['amount']
                stu = request.POST['student']
                stt = Student.objects.get(id=stu)
                tes = request.POST['test']
                ttt = Test.objects.get(id=tes)
                sub = request.POST['subject']
                rr = Result.objects.get(name=ttt,subject=teacher.subject,student=stt,time="first academic term")
                rr.status = amount
                rr.save()
                return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
        for s in Student.objects.all():
            st = Student.objects.get(pk=s.id)
            for t in test:
                tt = Test.objects.get(pk=t.id)
                for su in Subject.objects.all():
                    ss = Subject.objects.get(pk=su.id)
                    if not Result.objects.filter(student=st,name=tt,subject=ss,time="first academic term",year=AcademicYear.objects.last()):
                        Result.objects.create(subject=ss,year=y,student=st,time="first academic term",name=tt,status="0")
                        return redirect('t_one_result',grade.id)
        if result:
            for rrr in student:
                total = Result.objects.filter(student=rrr,time="first academic term",year=AcademicYear.objects.last()).aggregate(Sum('status'))['status__sum']
                totalll = Result.objects.filter(student=rrr,subject=teacher.subject,time="first academic term",year=AcademicYear.objects.last()).aggregate(Sum('status'))['status__sum']
                totall = test.aggregate(Sum('capacity'))['capacity__sum']
                gra = Grade.objects.get(id=rrr.profile.grade.id)
                g = Subject.objects.filter(grade=gra)
                if totall:
                    tot = (totall * g.count())
                    if tot != 0 :
                        average = (total/tot)*100
                    else:
                        average = (0/1)*100
                else:
                    tot = (0 * g.count())
                    average = (total/1)*100
                rrr.average = average
                rrr.save()
                ggg = Grade.objects.get(name=rrr.grade)
                if StudentStatus.objects.filter(student=rrr,time=y).exists():
                    aaaa = StudentStatus.objects.get(student=rrr,time=y)
                    aaaa.first_average=average
                    aaaa.first_from=tot
                    aaaa.first_total=total
                    if aaaa.first_total and aaaa.second_total:
                        aaaa.average=((aaaa.first_total+aaaa.second_total)/(aaaa.first_from+aaaa.second_from))*100
                    else:
                        average=0
                    aaaa.save()
                else:
                    StudentStatus.objects.create(student=rrr,time=y,first_average=average,first_from=tot,first_total=total)
                if SubjectReslut.objects.filter(student=rrr,subject=teacher.subject,grade=ggg,time=y).exists():
                    sss = SubjectReslut.objects.get(student=rrr,subject=teacher.subject,grade=ggg,time=y)
                    sss.first = totalll
                    sss.f_from = totall
                    sss.save()
                else:
                    SubjectReslut.objects.create(student=rrr,subject=teacher.subject,grade=ggg,time=y,first=total,f_from=totall)
        
    else:return HttpResponse("This is not you class what are you doing here?")
    context = {
        "web":web,
        'user':user,
        'teacher':teacher,
        'student':student,
        'test':test,
        'result':result,
        'grade':grade,
        'total':totalll,
        'totall':totall,
    }
    return render(request,'teacher/result.html',context)


@login_required(login_url='login')
def tworesults(request,id):
    web = Webpack.objects.get(pk=1)
    user = request.user
    y = AcademicYear.objects.last()
    pp = Profile.objects.get(user=user)
    teacher = Teacher.objects.get(profile=pp)
    grade = Grade.objects.get(pk=id)
    totalll = None
    totall = None
    if Teacher.objects.filter(profile=pp,my_room=grade).exists():
        student = Student.objects.filter(grade=grade.name,is_verified=True)
        test = Test.objects.filter(grade=grade,time="second academic term",year=y)
        result = Result.objects.filter(subject=teacher.subject,time="second academic term",year=y)
        if request.method == 'POST':
            if 'test_add' in request.POST:
                amount = request.POST['amount']
                stu = request.POST['student']
                stt = Student.objects.get(id=stu)
                tes = request.POST['test']
                ttt = Test.objects.get(id=tes)
                sub = request.POST['subject']
                rr = Result.objects.get(name=ttt,subject=teacher.subject,student=stt,time="second academic term")
                rr.status = amount
                rr.save()
                return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
               
        for s in Student.objects.all():
            st = Student.objects.get(pk=s.id)
            for t in test:
                tt = Test.objects.get(pk=t.id)
                for su in Subject.objects.all():
                    ss = Subject.objects.get(pk=su.id)
                    if not Result.objects.filter(student=st,name=tt,subject=ss,time="second academic term"):
                        Result.objects.create(subject=ss,year=y,student=st,time="second academic term",name=tt,status="0")
                        return redirect('t_two_result',grade.id)
        if result:
            for rrr in student:
                total = Result.objects.filter(student=rrr,time="second academic term",year=AcademicYear.objects.last()).aggregate(Sum('status'))['status__sum']
                totalll = Result.objects.filter(student=rrr,subject=teacher.subject,time="second academic term",year=AcademicYear.objects.last()).aggregate(Sum('status'))['status__sum']
                totall = test.aggregate(Sum('capacity'))['capacity__sum']
                gra = Grade.objects.get(id=rrr.profile.grade.id)
                g = Subject.objects.filter(grade=gra)
                if totall:
                    tot = (totall * g.count())
                    if tot != 0 :
                        average = (total/tot)*100
                    else:
                        average = (0/1)*100
                else:
                    tot = (0 * g.count())
                    average = (total/1)*100
                rrr.average = average
                rrr.save()
                ggg = Grade.objects.get(name=rrr.grade)
                if StudentStatus.objects.filter(student=rrr,time=y).exists():
                    aaaa = StudentStatus.objects.get(student=rrr,time=y)
                    aaaa.second_average=average
                    aaaa.second_from=tot
                    aaaa.second_total=total
                    if aaaa.first_total and aaaa.second_total:
                        aaaa.average = ((aaaa.first_total+aaaa.second_total)/(aaaa.first_from+aaaa.second_from))*100
                    else:
                        average=0
                    aaaa.save()
                else:
                    StudentStatus.objects.create(student=rrr,time=y,second_average=average,second_from=tot,second_total=total)
                if SubjectReslut.objects.filter(student=rrr,subject=teacher.subject,grade=ggg,time=y).exists():
                    sss = SubjectReslut.objects.get(student=rrr,subject=teacher.subject,grade=ggg,time=y)
                    sss.second = totalll
                    sss.s_from = totall
                    sss.save()
                else:
                    SubjectReslut.objects.create(student=rrr,subject=teacher.subject,grade=ggg,time=y,second=total,s_from=totall)
                  
    else:return HttpResponse("This is not you class what are you doing here?")
    context = {
        "web":web,
        'user':user,
        'teacher':teacher,
        'student':student,
        'test':test,
        'result':result,
        'grade':grade,
        'total':totalll,
        'totall':totall,
    }
    return render(request,'teacher/result.html',context)

@login_required(login_url='login')
def addpost(request):
    web = Webpack.objects.get(pk=1)
    user = request.user
    pp = Profile.objects.get(user=user)
    teacher = Teacher.objects.get(profile=pp)
    grade = Grade.objects.all()
    if request.method == 'POST':
        a = request.POST['for']
        gr = Grade.objects.get(pk=a)
        b = request.POST['title']
        c = request.POST['disc']
        d = request.POST['link1']
        e = request.POST['link2']
        f = request.POST['link3']
        if not request.FILES:
            GradePost.objects.create(for_grade=gr,title=b,disc=c,link1=d,link2=e,link3=f)
            messages.success(request,'Message Posted Successufully')
        else:
            try:
                if 'file1' in request.FILES:
                    g = request.FILES['file1']
                    GradePost.objects.create(for_grade=gr,title=b,disc=c,link1=d,link2=e,link3=f,file1=g)
                    messages.success(request,'Message Posted Successufully')
                elif 'file2' in request.FILES:
                    h = request.FILES['file2']
                    GradePost.objects.create(for_grade=gr,title=b,disc=c,link1=d,link2=e,link3=f,file1=g,file2=h)
                    messages.success(request,'Message Posted Successufully')
                else:
                    i = request.FILES['file3']
                    GradePost.objects.create(for_grade=gr,title=b,disc=c,link1=d,link2=e,link3=f,file1=g,file2=h,file3=i)
                    messages.success(request,'Message Posted Successufully')
            except:messages.error(request,'Error is occured in your files please add them by order')
    context = {
        'web':web,
        'user':user,
        'teacher':teacher,
        'grade':grade,
    }
    return render(request,'teacher/add post.html',context)


@login_required(login_url='login')
def addcourse(request):
    web = Webpack.objects.get(pk=1)
    user = request.user
    pp = Profile.objects.get(user=user)
    teacher = Teacher.objects.get(profile=pp)
    if request.method == 'POST':
        b = request.POST['name']
        c = request.POST['disc']
        if 'cover' in request.FILES:
            a = request.FILES['cover']
            if 'video' in request.FILES:
                d = request.FILES['video']
                aa = Course.objects.create(name=b,cover=a,about=c,video=d,posted_by=teacher)
                aa.subject.add(teacher.subject)
                aa.save()
                messages.success(request,'Course posted!')
            elif 'link' in request.POST:
                d = request.POST['link']
                aa = Course.objects.create(name=b,cover=a,about=c,link=d,posted_by=teacher)
                aa.subject.add(teacher.subject)
                aa.save()
                messages.success(request,'Course posted!')
        else:messages.error(request,'The Cover picture is neccesary')
    context = {
        'web':web,
        'user':user,
        'teacher':teacher,
    }
    return render(request,'teacher/add course.html',context)




@login_required(login_url='login')
def addbook(request):
    web = Webpack.objects.get(pk=1)
    user = request.user
    pp = Profile.objects.get(user=user)
    teacher = Teacher.objects.get(profile=pp)
    if request.method == 'POST':
        b = request.POST['name']
        c = request.POST['disc']
        e = request.POST['author']
        if request.FILES:
            a = request.FILES['cover']
            d = request.FILES['file']
            Library.objects.create(name=b,cover=a,file=d,author=e,disc=c,posted_by=pp)
            messages.success(request,"Book posted succesfully")
    context = {
        'web':web,
        'user':user,
        'teacher':teacher,
    }
    return render(request,'teacher/add book.html',context)


@login_required(login_url='login')
def editbook(request,id):
    web = Webpack.objects.get(pk=1)
    user = request.user
    pp = Profile.objects.get(user=user)
    teacher = Teacher.objects.get(profile=pp)
    l = Library.objects.get(pk=id)
    if request.method == 'POST':
        b = request.POST['name']
        c = request.POST['disc']
        e = request.POST['author']
        messages.success(request,"Book updated succesfully")
        l.name=b
        l.disc=c
        l.author=e
        l.save()
        if request.FILES:
            if 'cover' in request.FILES:
                d = request.FILES['cover']
                l.cover=d
                l.save()
            if 'file' in request.FILES:
                d = request.FILES['file']
                l.file=d
                l.save()
    context = {
        'web':web,
        'user':user,
        'l':l,
        'teacher':teacher,
    }
    return render(request,'teacher/channel/my-book.html',context)


@login_required(login_url='login')
def channel(request):
    web = Webpack.objects.get(pk=1)
    user = request.user
    pp = Profile.objects.get(user=user)
    teacher = Teacher.objects.get(profile=pp)
    course = Course.objects.filter(posted_by=teacher).order_by('name')
    search = None
    if request.method == 'POST':
        search = request.POST['tsearch']
        course = Course.objects.filter(posted_by=teacher,name__icontains=search).order_by('name')
    context = {
        'web':web,
        'user':user,
        'teacher':teacher,
        'course':course,
        'search':search,
    }
    return render(request,'teacher/channel/channel.html',context)

@login_required(login_url='login')
def editcourse(request,id):
    web = Webpack.objects.get(pk=1)
    user = request.user
    pp = Profile.objects.get(user=user)
    teacher = Teacher.objects.get(profile=pp)
    course = Course.objects.get(pk=id)
    if request.method == 'POST':
        b = request.POST['name']
        c = request.POST['disc']
        course.name=b
        course.about=c
        course.save()
        if 'cover' in request.FILES:
            a = request.FILES['cover']
            course.cover=a
            course.save()
        if ('video' in request.FILES) and ('link' in request.POST):
            messages.error(request,"You can't add both video and link at once you have to choose one.")
        elif 'video' in request.FILES:
            d = request.FILES['video']
            course.video=d
            course.link=None
            course.save()
            messages.success(request,'Course updated!')
        elif 'link' in request.POST:
            z = request.POST['link']
            course.link=z
            course.video=None
            course.save()
            messages.success(request,'Course updated!')
    context = {
        'web':web,
        'user':user,
        'teacher':teacher,
        'course':course,
    }
    return render(request,'teacher/channel/edit-video.html',context)

@login_required(login_url='login')
def deletecourse(request):
    if request.method == 'POST':
        if 'deletecourse' in request.POST:
            id = request.POST['id']
            course = Course.objects.get(id=id)
            course.delete()
            messages.success(request,'Course deleted Succesfully ')
            return redirect('t_channel')
        if 'deletemessage' in request.POST:
            id = request.POST['id']
            course = GradePost.objects.get(id=id)
            course.delete()
            messages.success(request,'Meassage deleted Succesfully ')
            return redirect('t_message')
        if 'deletebook' in request.POST:
            id = request.POST['id']
            course = Library.objects.get(id=id)
            course.delete()
            messages.success(request,'Selected Book deleted Succesfully ')
            return redirect('t_book')


@login_required(login_url='login')
def myvideo(request,id):
    web = Webpack.objects.get(pk=1)
    user = request.user
    pp = Profile.objects.get(user=user)
    teacher = Teacher.objects.get(profile=pp)
    course = Course.objects.get(pk=id)
    c = CourseComment.objects.filter(course=course)
    context = {
        'web':web,
        'user':user,
        'teacher':teacher,
        'course':course,
        'c':c,
    }
    return render(request,'teacher/channel/my-video.html',context)

@login_required(login_url='login')
def message(request):
    web = Webpack.objects.get(pk=1)
    user = request.user
    pp = Profile.objects.get(user=user)
    teacher = Teacher.objects.get(profile=pp)
    grade = GradePost.objects.filter(teacher=teacher)
    context = {
        'web':web,
        'user':user,
        'teacher':teacher,
        'grade':grade,
    }
    return render(request,'teacher/channel/messsage.html',context)

@login_required(login_url='login')
def editmessage(request,id):
    web = Webpack.objects.get(pk=1)
    user = request.user
    pp = Profile.objects.get(user=user)
    teacher = Teacher.objects.get(profile=pp)
    gg = GradePost.objects.get(pk=id)
    grade = Grade.objects.all().exclude(id=gg.for_grade.id)
    if request.method == 'POST':
        a = request.POST['for']
        gr = Grade.objects.get(pk=a)
        b = request.POST['title']
        c = request.POST['disc']
        messages.success(request,'Message Updated Successufully')
        if 'link1' in request.POST:
            d = request.POST['link1']
            gg.link1=d
            gg.save()
        if 'link2' in request.POST:
            d = request.POST['link2']
            gg.link2=d
            gg.save()
        if 'link3' in request.POST:
            d = request.POST['link3']
            gg.link3=d
            gg.save()
        if request.FILES:
            try:
                if 'file1' in request.FILES:
                    g = request.FILES['file1']
                    gg.file1=g
                    gg.save()
                if 'file2' in request.FILES:
                    g = request.FILES['file2']
                    gg.file2=g
                    gg.save()
                if 'file3' in request.FILES:
                    g = request.FILES['file3']
                    gg.file3=g
                    gg.save()
            except:messages.error(request,'Error is occured in your files please add them by order')
    context = {
        'web':web,
        'user':user,
        'teacher':teacher,
        'gg':gg,
        'grade':grade,
    }
    return render(request,'teacher/channel/my-message.html',context)


@login_required(login_url='login')
def books(request):
    web = Webpack.objects.get(pk=1)
    user = request.user
    pp = Profile.objects.get(user=user)
    teacher = Teacher.objects.get(profile=pp)
    lib = Library.objects.filter(posted_by=pp)
    context = {
        'web':web,
        'user':user,
        'teacher':teacher,
        'lib':lib,
    }
    return render(request,'teacher/channel/book.html',context)



@login_required(login_url='login')
def all(request):
    web = Webpack.objects.get(pk=1)
    user = request.user
    pp = Profile.objects.get(user=user)
    teacher = Teacher.objects.get(profile=pp)
    context = {
        'web':web,
        'user':user,
        'teacher':teacher,
    }
    return render(request,'teacher/all class.html',context)


@login_required(login_url='login')
def TeacherProfile(request):
    web = Webpack.objects.get(pk=1)
    me = request.user
    event = Event.objects.all()
    pp = Profile.objects.get(user=me)
    teacher = Teacher.objects.get(profile=pp)
    sub = Subject.objects.all().exclude(id=teacher.subject.id)
    if request.method == 'POST':
        
            if 'update' in request.POST:
                first_name = request.POST['firstName']
                last_name = request.POST['lastName']
                email = request.POST['email']
                username = request.POST['username']
                phone = request.POST['phone']
                facebook = request.POST['facebook']
                telegram = request.POST['telegram']
                p1 = request.POST['password1']
                p2 = request.POST['password2']
                subject = request.POST['subject']
                sbj = Subject.objects.get(pk=subject)
                p = Password.objects.get(of=me)
                if request.FILES:
                    profile_pic = request.FILES['profile_pic']
                    teacher.profile_pic = profile_pic
                    teacher.save()
                    messages.success(request,'Your Profile Picture is Updated Successfully!')
                if p1:
                    if p1 != p2:
                        messages.error(request,"Passwords donot match!")
                    elif len(p1) < 8:
                        messages.error(request,"Password is too short it must be grater than 8 characters!")
                    else:
                        me.set_password(p1)
                        me.save()
                        p.password=p1
                        p.save()
                        messages.success(request,"Password Changed Successfully")
                        return redirect('logout')
                if username:
                    if me.username != username:
                        if User.objects.filter(username=username).exists():
                            messages.error(request,"username is already in use please change it!")
                        else:
                            me.username=username
                            teacher.username=username
                            teacher.save()
                            me.save()
                            messages.success(request,'Username Updated Succesfully')
                if first_name or last_name:
                    if not User.objects.filter(first_name=first_name,last_name=last_name).exists():
                        me.first_name=first_name
                        me.last_name=last_name
                        me.save()
                        p.first_name=first_name
                        p.last_name=last_name
                        p.save()
                        teacher.first_name = first_name
                        teacher.last_name = last_name
                        teacher.save()
                        messages.success(request,"Your name is updated successfully")
                if email:
                    if not User.objects.filter(email=email).exists():
                        me.email = email
                        p.email = email
                        me.save()
                        p.save()
                        messages.success(request,"Email Updated Successfully")
                if phone:
                    if pp.phone != phone:
                        if Profile.objects.filter(phone=phone).exists():
                            messages.error(request,"Phone Number is in Use please change it!")
                        else:
                            pp.phone=phone
                            p.phone=phone
                            pp.save()
                            p.save()
                            messages.success(request,'Phone Number updated Successfully')
                if facebook:
                    if not Teacher.objects.filter(facebook=facebook).exists():
                        teacher.facebook=facebook
                        teacher.save()
                        messages.success(request,"Your Facebook address updated Successfully!")
                if telegram:
                    if not Teacher.objects.filter(telegram=telegram).exists():
                        teacher.telegram=telegram
                        teacher.save()
                        messages.success(request,'Your Telegram url is updated Successfully!')
                if subject:
                    if not Teacher.objects.filter(subject=sbj).exists():
                        teacher.subject=sbj
                        teacher.save()
                        messages.success(request,"The change in your subject is saved successfully!")
            if 'delete' in request.POST:
                me.delete()
                messages.success(request,"Hey Dear user glad to work with you thank you for everything good bye!")
                return redirect('r_index')
        
    context = {
        "web":web,
        'event':event,
        'user':me,
        'teacher':teacher,
        'sub':sub,
    }
    return render(request,'teacher/profile.html',context)
