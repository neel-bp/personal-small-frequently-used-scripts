import basc_py4chan as chan
import urllib.request as ur

b = input('enter board: ')
board = chan.board(b)
t = int(input('enter thread number: '))
thread=board.get_thread(t)
posts=thread.all_posts

for post in posts:
    if post.has_file:
        fileurl=post.file_url
        fileext=post.file_extension
        ur.urlretrieve(fileurl,post.filename+str(fileext))
    else:
        pass