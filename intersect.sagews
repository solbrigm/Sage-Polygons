class segment(object):
    def __init__(self,point1,point2):
        self.point1=point1
        self.point2=point2
    def intersect(self,other):
        #one segment is [a,b], the other is [c,d]
        a=self.point1
        b=self.point2
        c=other.point1
        d=other.point2
        #if slopes are equal, they're either the same line or parallel
        if (b[1]-a[1])*(d[0]-c[0]) == (d[1]-c[1])*(b[0]-a[0]):
            #if slope between a point on seg1 and a point on seg2 is same as m1,
            #then all four points are on same line. Then just need to check they overlap.
            if (a[1]-d[1])*(b[0]-d[0])==(b[1]-d[1])*(a[0]-d[0]) and min(a[0],b[0])<=max(c[0],d[0]) and max(a[0],b[0])>=min(c[0],d[0]):
                return (True,None)
            else:
                return (False,None)
        t=var('t')
        s=var('s')
        Sol=solve([t*a[0]+(1-t)*b[0]==s*c[0]+(1-s)*d[0], t*a[1]+(1-t)*b[1]==s*c[1]+(1-s)*d[1]],s,t,solution_dict=True)
        t=Sol[0][t]
        s=Sol[0][s]
        if 0<=t<=1 and 0<=s<=1:
            return (True,(t*a[0]+(1-t)*b[0],t*a[1]+(1-t)*b[1]))
        else:
            return (False,None)
