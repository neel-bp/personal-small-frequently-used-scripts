import urllib.request as ur
import os
import basc_py4chan as chan
import sys

def threadposts(threadurl):
	board=chan.board(threadurl.split('/')[-3])
	thread=board.get_thread(int(threadurl.split('/')[-1]))
	return thread.all_posts

def main():
	filepath=os.path.dirname(os.path.realpath(__file__))
	
	posts=threadposts(str(sys.argv[1]))
	try:
		os.mkdir('downloaded')
	except:
		None
	try:
		for post in posts:
			if post.has_file:
				if os.path.exists(filepath+'\\'+'downloaded'+'\\'+post.filename):
					print(post.filename+' already exists')
				else:
					ur.urlretrieve(post.file_url, filepath+'\\'+'downloaded'+'\\'+post.filename)
					print(post.filename+' downloaded')
			else:
				pass
	except KeyboardInterrupt:
		print('download failed/cancelled')

if __name__ == '__main__':
	main()